<template>
  <!-- Tailwind + HTML version of your Navbar -->

  <header class="w-full py-5 px-[12%] bg-black shadow text-white">
    <nav class="container mx-auto flex items-center justify-between">
      <!-- Left Section: Logo + Menu Button -->
      <div class="flex items-center gap-2">
        <div class="flex items-center gap-8">
          <a href="/">
            <img
              src="https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1637759004/Croma%20Assets/CMS/Category%20icon/Final%20icon/Croma_Logo_acrkvn.svg"
              alt="croma_logo"
            />
          </a>
          <button class="">
            <!-- Menu Icon -->
            <svg
              class="w-8 h-8"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M4 6h16M4 12h16M4 18h16"
              ></path>
            </svg>
          </button>
        </div>
        <button class="">Menu</button>
      </div>

      <!-- Search Bar -->
      <div
        class="hidden md:flex items-center border border-gray-300 rounded-md px-4 py-2 w-96 bg-white text-gray-800"
      >
        <input
          type="text"
          placeholder="What are you looking for?"
          class="w-full outline-none"
        />
        <svg
          class="w-6 h-6 text-gray-500"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
          ></path>
        </svg>
      </div>

      <!-- Right Icons -->
      <div class="flex items-center gap-6">
        <button class="flex gap-1 items-center text-sm">
          <svg
            class="w-5 h-5 text-gray-600"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M17.657 16.657L13.414 12.414a8 8 0 111.414-1.414l4.243 4.243a1 1 0 01-1.414 1.414z"
            ></path>
          </svg>
          Patna, 201206
          <svg
            class="w-4 h-4 text-blue-500"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M11 5h6m2 0h.01M17 5l.011.011M12 12v9m0 0l3-3m-3 3l-3-3"
            ></path>
          </svg>
        </button>

        <div class="relative group">
          <svg
            class="w-6 h-6 cursor-pointer"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M10 10a4 4 0 100-8 4 4 0 000 8zM2 18a8 8 0 1116 0H2z"
            ></path>
          </svg>
          <!-- Hover menu -->
          <!-- <div
            class="hidden group-hover:flex flex-col gap-4 absolute top-full right-0 mt-2 bg-gray-800 text-white text-sm w-72 p-4 rounded shadow-lg z-10"
          >
            <a href="#" class="flex items-center gap-2 hover:text-blue-400"
              ><span>👤</span> My Profile</a
            >
            <a href="#" class="flex items-center gap-2 hover:text-blue-400"
              ><span>📦</span> My Orders</a
            >
            <a href="#" class="flex items-center gap-2 hover:text-blue-400"
              ><span>❤️</span> My Wishlist</a
            >
            <a href="#" class="flex items-center gap-2 hover:text-blue-400"
              ><span>🔧</span> My Services</a
            >
            <hr class="border-gray-700" />
            <a href="#" class="flex items-center gap-2 hover:text-red-400"
              ><span>🚪</span> Logout</a
            >
          </div> -->

          <div
            class="hidden group-hover:flex flex-col gap-4 absolute top-full right-0 mt-2 bg-gray-800 text-white text-sm w-48 p-4 rounded shadow-lg z-10"
          >
            <a href="#" class="flex items-center gap-2 hover:text-blue-400">
              <User class="w-5 h-5" />
              My Profile
            </a>

            <a href="#" class="flex items-center gap-2 hover:text-blue-400">
              <Package class="w-5 h-5" />
              My Orders
            </a>

            <a href="#" class="flex items-center gap-2 hover:text-blue-400">
              <Heart class="w-5 h-5" />
              My Wishlist
            </a>

            <a href="#" class="flex items-center gap-2 hover:text-blue-400">
              <Wrench class="w-5 h-5" />
              My Services
            </a>

            <hr class="border-gray-700" />

            <a href="#" class="flex items-center gap-2 hover:text-red-400">
              <LogOut class="w-5 h-5" />
              Logout
            </a>
          </div>
        </div>

        <!-- Cart -->
        <div data-testid="cart">
          <a
            href="/cart"
            class="relative flex items-center hover:text-blue-400"
          >
            <ShoppingCart class="w-6 h-6 text-white" />
            <span
              id="cart_count_notification"
              class="absolute -top-2 -right-2 bg-red-500 text-white text-xs w-5 h-5 flex items-center justify-center rounded-full"
            >
              0
            </span>
          </a>
        </div>
      </div>
    </nav>
  </header>
</template>

<script setup>
import {
  ShoppingCart,
  User,
  Package,
  Heart,
  Wrench,
  LogOut,
} from "lucide-vue-next";
</script>
