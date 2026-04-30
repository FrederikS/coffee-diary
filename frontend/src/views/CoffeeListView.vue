<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useGraphQL } from '../composables/useGraphQL'
import { GET_COFFEES } from '../queries/getCoffees'

interface Roastery {
  id: number
  name: string
}

interface CoffeeType {
  id: number
  value: string
}

interface Country {
  id: number
  name: string
}

interface ProfileTag {
  id: number
  value: string
}

interface Image {
  id: number
  sourceUrl: string
}

interface DrinkType {
  id: number
  value: string
}

interface Rating {
  id: number
  rating: number
  drinkType: DrinkType | null
}

interface Coffee {
  id: number
  name: string
  arabica: number
  robusta: number
  profileDescription: string
  price: number
  link: string
  createdAt: string
  roastery: Roastery | null
  type: CoffeeType | null
  countries: Country[]
  profileTags: ProfileTag[]
  images: Image[]
  ratings: Rating[]
}

const coffees = ref<Coffee[]>([])
const { loading, error, request } = useGraphQL()

onMounted(async () => {
  const data = await request<{ coffees: Coffee[] }>(GET_COFFEES)
  coffees.value = data.coffees
})

function formatPrice(price: string | number): string {
  const num = typeof price === 'string' ? parseFloat(price) : price
  return `${num.toFixed(2)} €`
}

function formatArabicaRobusta(arabica: number, robusta: number): string {
  return `${arabica}/${robusta}`
}

function formatCountries(countries: Country[]): string {
  if (!countries || countries.length === 0) return '-'
  return countries.map(c => c.name).join(', ')
}

function formatProfileTags(tags: ProfileTag[]): string {
  if (!tags || tags.length === 0) return '-'
  return tags.map(t => t.value).join(', ')
}

function formatType(type: CoffeeType | null): string {
  return type?.value || '-'
}

function formatRoastery(roastery: Roastery | null): string {
  return roastery?.name || '-'
}

function averageRating(ratings: Rating[]): string {
  if (!ratings || ratings.length === 0) return '-'
  const sum = ratings.reduce((acc, r) => acc + r.rating, 0)
  return (sum / ratings.length).toFixed(1)
}
</script>

<template>
  <div class="max-w-[1100px] mx-auto px-4 sm:px-8 py-8">
    <p v-if="loading" class="text-latte">Loading...</p>

    <p v-else-if="error" class="text-[14px] text-slate">
      {{ error }}
    </p>

    <template v-else-if="coffees.length === 0">
      <p class="text-latte">No coffees found</p>
    </template>

    <table v-else class="w-full">
      <thead>
        <tr class="border-b border-oat">
          <th class="text-left text-[11px] uppercase tracking-[0.07em] text-latte py-3 pr-4">Name</th>
          <th class="text-left text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Roastery</th>
          <th class="text-left text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Type</th>
          <th class="text-left text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Origins</th>
          <th class="text-left text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Profile</th>
          <th class="text-right text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Rating</th>
          <th class="text-right text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Arabica/Robusta</th>
          <th class="text-right text-[11px] uppercase tracking-[0.07em] text-latte py-3 px-4">Price</th>
          <th class="text-left text-[11px] uppercase tracking-[0.07em] text-latte py-3 pl-4">Link</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="coffee in coffees" :key="coffee.id" class="border-b border-oat">
          <td class="text-[14px] text-espresso py-3 pr-4">{{ coffee.name }}</td>
          <td class="text-left text-[14px] text-espresso py-3 px-4">{{ formatRoastery(coffee.roastery) }}</td>
          <td class="text-left text-[14px] text-espresso py-3 px-4">{{ formatType(coffee.type) }}</td>
          <td class="text-left text-[14px] text-espresso py-3 px-4">{{ formatCountries(coffee.countries) }}</td>
          <td class="text-left text-[14px] text-espresso py-3 px-4">{{ formatProfileTags(coffee.profileTags) }}</td>
          <td class="text-right text-[14px] text-espresso py-3 px-4">{{ averageRating(coffee.ratings) }}</td>
          <td class="text-right text-[14px] text-espresso py-3 px-4">
            {{ formatArabicaRobusta(coffee.arabica, coffee.robusta) }}
          </td>
          <td class="text-right text-[14px] text-espresso py-3 px-4">
            {{ formatPrice(coffee.price) }}
          </td>
          <td class="text-left py-3 pl-4">
            <a
              :href="coffee.link"
              target="_blank"
              rel="noopener noreferrer"
              class="inline-flex items-center gap-1 text-[14px] text-amber hover:underline"
            >
              Visit
            </a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>