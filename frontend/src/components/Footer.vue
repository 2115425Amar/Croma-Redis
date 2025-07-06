<template>
  <footer class="text-white bg-zinc-800 py-8 pl-[8%] mt-8">
    <div class="container mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">

      <!-- CONNECT WITH US -->
      <div class="space-y-4 border-r-2 pr-4">
        <div class="flex flex-col space-y-2">
          <label for="email" class="text-sm font-semibold">CONNECT WITH US</label>
          <input type="email" id="email" placeholder="Enter Email ID" class="bg-white text-black p-2 rounded" />
          <div class="flex space-x-4 text-xl">
            <Icon :icon="facebookIcon" class="cursor-pointer hover:text-blue-600" />
            <Icon :icon="instagramIcon" class="cursor-pointer hover:text-pink-500" />
            <Icon :icon="linkedinIcon" class="cursor-pointer hover:text-blue-400" />
            <Icon :icon="twitterIcon" class="cursor-pointer hover:text-sky-400" />
            <Icon :icon="youtubeIcon" class="cursor-pointer hover:text-red-600" />
          </div>
        </div>
        <p class="text-xs mt-4">&copy; 2025 Croma. All rights reserved</p>
      </div>

      <!-- USEFUL LINKS -->
      <div class="grid grid-cols-2 gap-4 border-r-2">
        <div class="space-y-2">
          <h5 class="text-sm font-semibold">USEFUL LINKS</h5>
          <ul class="space-y-1">
            <li><a href="#" class="hover:text-gray-400">About Croma</a></li>
            <li><a href="#" class="hover:text-gray-400">Help And Support</a></li>
            <li><a href="#" class="hover:text-gray-400">FAQs</a></li>
            <li><a href="#" class="hover:text-gray-400">Buying Guide</a></li>
            <li><a href="#" class="hover:text-gray-400">Return Policy</a></li>
            <li><a href="#" class="hover:text-gray-400">B2B Orders</a></li>
            <li><a href="#" class="hover:text-gray-400">Store Locator</a></li>
            <li><a href="#" class="hover:text-gray-400">E-Waste</a></li>
            <li><a href="#" class="hover:text-gray-400">Franchise Opportunity</a></li>
          </ul>
        </div>
        <div class="space-y-2">
          <ul class="space-y-1 mt-6">
            <li><a href="#" class="hover:text-gray-400">Site Map</a></li>
            <li><a href="#" class="hover:text-gray-400">Careers At Croma</a></li>
            <li><a href="#" class="hover:text-gray-400">Terms Of Use</a></li>
            <li><a href="#" class="hover:text-gray-400">Disclaimer</a></li>
            <li><a href="#" class="hover:text-gray-400">Privacy Policy</a></li>
            <li><a href="#" class="hover:text-gray-400">Unboxed</a></li>
            <li><a href="#" class="hover:text-gray-400">Gift Card</a></li>
            <li><a href="#" class="hover:text-gray-400">Croma E-Star</a></li>
          </ul>
        </div>
      </div>

      <!-- PRODUCTS SECTION -->
      <div class="grid grid-cols-2 gap-4 border-r-2">
        <div class="space-y-2">
          <h5 class="text-sm font-semibold">USEFUL LINKS</h5>
          <ul class="space-y-1">
            <li><a href="#" class="hover:text-gray-400">Televisions & Accessories</a></li>
            <li><a href="#" class="hover:text-gray-400">Home Appliances</a></li>
            <li><a href="#" class="hover:text-gray-400">Phones & Wearables</a></li>
            <li><a href="#" class="hover:text-gray-400">Computers & Tablets</a></li>
            <li><a href="#" class="hover:text-gray-400">Kitchen Appliances</a></li>
            <li><a href="#" class="hover:text-gray-400">Audio & Video</a></li>
            <li><a href="#" class="hover:text-gray-400">Health & Fitness</a></li>
            <li><a href="#" class="hover:text-gray-400">Grooming & Personal Care</a></li>
            <li><a href="#" class="hover:text-gray-400">Cameras & Accessories</a></li>
          </ul>
        </div>
        <div class="space-y-2">
          <ul class="space-y-1 mt-6">
            <li><a href="#" class="hover:text-gray-400">Gaming</a></li>
            <li><a href="#" class="hover:text-gray-400">Accessories</a></li>
            <li><a href="#" class="hover:text-gray-400">Top Brands</a></li>
          </ul>
        </div>
      </div>

    </div>
  </footer>
</template>

<script setup>
import { Icon } from '@iconify/vue'
import facebookIcon from '@iconify-icons/fa6-brands/facebook-f'
import instagramIcon from '@iconify-icons/fa6-brands/instagram'
import linkedinIcon from '@iconify-icons/fa6-brands/linkedin-in'
import twitterIcon from '@iconify-icons/fa6-brands/twitter'
import youtubeIcon from '@iconify-icons/fa6-brands/youtube'
</script>