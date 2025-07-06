<template>
  <div class="sticky top-0 z-50">
    <Navbar />
  </div>

  <div class="bg-[#191919] text-white">
    <div class="m-auto pb-[5%] px-8">
      <h1 class="h-12 ml-[10%] py-8">Televisions & Accessories</h1>
    </div>
    <div class="main-content">
      <div class="product-grid">
        <Product v-for="product in products" :key="product.sku" :product="product"
          @product-click="handleProductClick" />
      </div>
      <div v-if="loading" class="loading">Loading products...</div>
      <div v-if="error" class="error">{{ error }}</div>
    </div>
    <Footer />
  </div>
</template>

<script>
import Footer from "./components/Footer.vue";
import Navbar from "./components/Navbar.vue";
import Product from "./components/Product.vue";

export default {
  name: "CromaProducts",
  components: {
    Navbar,
    Product,
    Footer,
  },
  data() {
    return {
      products: [],
      loading: false,
      error: null,
    };
  },
  mounted() {
    this.fetchProducts();
  },
  methods: {
    async fetchProducts() {
      this.loading = true;
      this.error = null;

      try {
        const response = await fetch("http://localhost:5000/scraped-content");
        if (!response.ok)
          throw new Error(`HTTP error! status: ${response.status}`);

        const data = await response.json();
        if (data.success && data.data) {
          this.products = this.extractProductsFromData(data.data);
        } else {
          throw new Error("Invalid data structure received");
        }
      } catch (error) {
        console.error("Error fetching products:", error);
        this.error = "Failed to load products. Please try again later.";
        await this.loadFromProductsFallback();
      } finally {
        this.loading = false;
      }
    },

    extractProductsFromData(data) {
      const headContent = data.head || "";
      const jsonLdMatch = headContent.match(
        /<script type="application\/ld\+json">\s*({[\s\S]*?})\s*<\/script>/g
      );

      if (jsonLdMatch) {
        for (const match of jsonLdMatch) {
          const jsonContent = match
            .replace(/<script[^>]*>|<\/script>/g, "")
            .trim();
          try {
            const parsed = JSON.parse(jsonContent);
            if (parsed["@type"] === "OfferCatalog" && parsed.itemListElement) {
              return parsed.itemListElement.map((item) => ({
                sku: item.item.sku,
                name: item.item.name,
                brand: item.item.brand,
                description: item.item.description,
                url: item.item.url,
                image:
                  item.item.image || this.getPlaceholderImage(item.item.brand),
                price: this.extractPrice(item.item.name),
                rating: this.generateRating(),
                features: this.extractFeatures(item.item.name),
              }));
            }
          } catch (e) {
            console.warn("Error parsing JSON-LD:", e);
          }
        }
      }
      return [];
    },

    getPlaceholderImage(brand) {
      const brandImages = {
        // 'Croma': 'https://m.media-amazon.com/images/I/81BENnbPpuL._SL1500_.jpg',
        'Samsung': "https://m.media-amazon.com/images/I/41I-s+13NkL._SX300_SY300_.jpg",
        'LG': 'https://m.media-amazon.com/images/I/81P2YOHSQRL._SL1500_.jpg',
        'TCL': 'https://m.media-amazon.com/images/I/71XiC9IBdCL._SL1500_.jpg',
        'Xiaomi': 'https://m.media-amazon.com/images/I/71RkWGWWrjL._SL1500_.jpg'
      };
      return brandImages[brand] || 'https://m.media-amazon.com/images/I/71ma0AXgxjL._SL1500_.jpg';
    },

    extractPrice(name) {
      const size = this.extractSize(name);
      const hasSmartFeatures = name.toLowerCase().includes("smart");
      const has4K = name.toLowerCase().includes("4k");

      let basePrice = 15000;
      if (size >= 55) basePrice = 45000;
      else if (size >= 43) basePrice = 30000;
      else if (size >= 40) basePrice = 25000;
      else if (size >= 32) basePrice = 20000;

      if (has4K) basePrice *= 1.3;
      if (hasSmartFeatures) basePrice *= 1.2;

      return Math.round(basePrice);
    },

    extractSize(name) {
      const sizeMatch = name.match(/(\d+)\s*(?:cm|inch)/i);
      if (sizeMatch) {
        const size = parseInt(sizeMatch[1]);
        return size > 100 ? Math.round(size / 2.54) : size;
      }
      return 32;
    },

    extractFeatures(name) {
      const features = [];
      const nameUpper = name.toUpperCase();

      if (nameUpper.includes("4K")) features.push("4K Ultra HD");
      if (nameUpper.includes("SMART")) features.push("Smart TV");
      if (nameUpper.includes("GOOGLE")) features.push("Google TV");
      if (nameUpper.includes("ANDROID")) features.push("Android TV");
      if (nameUpper.includes("DOLBY")) features.push("Dolby Audio");
      if (nameUpper.includes("LED")) features.push("LED Display");
      if (nameUpper.includes("QLED")) features.push("QLED Technology");
      if (nameUpper.includes("VOICE")) features.push("Voice Control");

      return features.slice(0, 3);
    },

    generateRating() {
      return (Math.random() * 2 + 3).toFixed(1);
    },

    guessBrand(title) {
      const titleUpper = title.toUpperCase();
      if (titleUpper.includes("SAMSUNG")) return "Samsung";
      if (titleUpper.includes("LG")) return "LG";
      if (titleUpper.includes("TCL")) return "TCL";
      if (titleUpper.includes("XIAOMI") || titleUpper.includes("MI"))
        return "Xiaomi";
      if (titleUpper.includes("CROMA")) return "Croma";
      return "Croma";
    },

    async loadFromProductsFallback() {
      try {
        const response = await fetch("http://localhost:5000/products");
        if (!response.ok) throw new Error(`Status ${response.status}`);

        const fallbackProducts = await response.json();
        this.products = fallbackProducts.map((p) => ({
          sku: p.product_id,
          name: p.title,
          brand: this.guessBrand(p.title),
          description: p.discount_message,
          price: parseInt(p.sale_price.replace(/[^0-9]/g, "")),
          rating: this.generateRating(),
          features: this.extractFeatures(p.title),
          image: this.getPlaceholderImage(this.guessBrand(p.title)),
          url: "#",
        }));
      } catch (e) {
        this.error = "Unable to load even fallback products.";
        console.error(e);
      }
    },

    handleProductClick(product) {
      console.log("Product clicked:", product);
      if (product.url) {
        window.open(product.url, "_blank");
      }
    },
  },
};
</script>

<style scoped>
.main-content {
  /* padding: 20px; */
  max-width: 1200px;
  margin: 0 auto;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 60px;
  margin-bottom: 0px;
}

.loading {
  text-align: center;
  padding: 40px;
  font-size: 18px;
  color: #666;
}

.error {
  text-align: center;
  padding: 40px;
  color: #e74c3c;
  background-color: #fadbd8;
  border: 1px solid #e74c3c;
  border-radius: 8px;
  margin: 20px 0;
}
</style>