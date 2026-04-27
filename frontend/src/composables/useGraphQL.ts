import { ref } from 'vue'
import { GraphQLClient } from 'graphql-request'
import JSONbig from 'json-bigint'

export function useGraphQL() {
  const loading = ref(true)
  const error = ref<string | null>(null)

  const client = new GraphQLClient(
    import.meta.env.VITE_API_URL || 'http://localhost:8080/graphql',
    { jsonSerializer: JSONbig({ useNativeBigInt: true }) }
  )

  async function request<T>(query: string, variables?: Record<string, unknown>) {
    loading.value = true
    error.value = null

    try {
      const data = await client.request<T>(query, variables)
      return data
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to load data'
      throw e
    } finally {
      loading.value = false
    }
  }

  return { client, loading, error, request }
}