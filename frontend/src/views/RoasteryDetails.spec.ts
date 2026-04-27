import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'
import { ref } from 'vue'
import RoasteryDetails from './RoasteryDetails.vue'

vi.mock('vue-router', () => ({
  useRoute: () => ({ params: { id: '1' } }),
}))

vi.mock('../composables/useGraphQL', () => ({
  useGraphQL: () => {
    const loading = ref(true)
    const error = ref(null)
    const request = vi.fn().mockImplementation(async () => {
      const result = { roasteryById: { id: 1, name: 'Test Roastery', website: 'https://test.com' } }
      loading.value = false
      return result
    })
    return { loading, error, request }
  },
}))

describe('RoasteryDetails', () => {
  it('renders without crashing', () => {
    const wrapper = mount(RoasteryDetails)
    expect(wrapper.exists()).toBe(true)
  })

  it('displays loading state initially', () => {
    const wrapper = mount(RoasteryDetails)
    expect(wrapper.text()).toContain('Loading')
  })

  it('displays roastery name after load', async () => {
    const wrapper = mount(RoasteryDetails)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('Test Roastery')
  })

  it('displays website link when present', async () => {
    const wrapper = mount(RoasteryDetails)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.html()).toContain('https://test.com')
  })
})