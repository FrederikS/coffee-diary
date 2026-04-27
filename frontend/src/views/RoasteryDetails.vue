<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { GraphQLClient } from 'graphql-request'
import JSONbig from 'json-bigint'
import { GET_ROASTERY_BY_ID } from '../queries/getRoasteryById'

interface Roastery {
  id: number
  name: string
  website: string | null
}

const route = useRoute()
const roastery = ref<Roastery | null>(null)
const error = ref<string | null>(null)
const loading = ref(true)

const jsonSerializer = JSONbig({ useNativeBigInt: true })

onMounted(async () => {
  const id = BigInt(route.params.id as string)
  const client = new GraphQLClient(import.meta.env.VITE_API_URL || 'http://localhost:8080/graphql', {
    jsonSerializer,
  })

  try {
    const data = await client.request<{ roasteryById: Roastery }>(GET_ROASTERY_BY_ID, { id })
    roastery.value = data.roasteryById
  } catch (e) {
    error.value = e instanceof Error ? e.message : 'Failed to load roastery'
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="max-w-[1100px] mx-auto px-4 sm:px-8 py-8">
    <template v-if="loading">
      <p class="text-latte">Loading...</p>
    </template>

    <template v-else-if="roastery">
      <p class="text-[11px] uppercase tracking-[0.07em] text-latte mb-1">Roastery</p>
      <h1 class="text-[22px] font-medium text-espresso mb-4">
        {{ roastery.name }}
      </h1>

      <div class="bg-surface border border-oat rounded-card p-5">
        <p v-if="roastery.website" class="text-[16px] text-espresso">
          <a
            :href="roastery.website"
            target="_blank"
            rel="noopener"
            class="text-amber hover:underline"
          >
            {{ roastery.website }}
          </a>
        </p>
        <p v-else class="text-[14px] text-latte">No website available</p>
      </div>
    </template>

    <p v-else-if="error" class="text-[14px] text-slate">
      {{ error }}
    </p>
  </div>
</template>