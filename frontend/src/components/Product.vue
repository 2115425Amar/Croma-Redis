<template>
  <div class="shadow-md cursor-pointer" @click="handleClick">
    <div class="relative bg-[#191919] overflow-hidden h-[300px] rounded-xl">
      <img :src="product.image" :alt="product.name" class="rounded-xl bg-[#393939] p-12" />
      <div class="absolute top-2 right-2 bg-[#191919] text-white text-xs font-bold p-3 rounded-2xl">
        Compare
      </div>
    </div>

    <div class="bg-[#191919] text-white p-4 flex flex-col flex-grow space-y-3">
      <h3 class="text-lg font-semibold leading-tight">
        {{ truncatedName }}
      </h3>

      <div class="flex items-center gap-2">
        <div class="flex gap-0.5 text-yellow-400">
          <span v-for="star in 5" :key="star" :class="star <= Math.floor(product.rating)
              ? 'text-yellow-400'
              : 'text-gray-600'
            ">
            ★
          </span>
        </div>
        <span class="text-sm text-gray-300 font-medium">{{
          product.rating
        }}</span>
      </div>

      <div class="flex items-baseline gap-2">
        <span class="text-white text-base font-semibold">₹</span>
        <span class="text-xl font-bold">{{ formattedPrice }}</span>
        <span v-if="hasDiscount" class="text-sm text-gray-400 line-through">
          ₹{{ originalPrice }}
        </span>
      </div>

      <div class="flex flex-wrap gap-2">
        <span v-for="feature in product.features" :key="feature"
          class="text-black text-xs px-4 py-2 rounded-full bg-[rgb(207,255,243)]">
          {{ feature }}
        </span>
      </div>
    </div>
    <hr class="bg-white-50" />
  </div>
</template>

<script>
export default {
  name: "Product",
  props: {
    product: {
      type: Object,
      required: true,
    },
  },
  computed: {
    truncatedName() {
      return this.product.name.length > 60
        ? this.product.name.substring(0, 60) + "..."
        : this.product.name;
    },
    formattedPrice() {
      return this.product.price.toLocaleString("en-IN");
    },
    hasDiscount() {
      return Math.random() > 0.7;
    },
    originalPrice() {
      return Math.round(this.product.price * 1.15).toLocaleString("en-IN");
    },
  },
  methods: {
    handleClick() {
      this.$emit("product-click", this.product);
    },
  },
};
</script>