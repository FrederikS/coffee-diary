import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'
import { ref } from 'vue'
import CoffeeListView from './CoffeeListView.vue'

const mockCoffees = [
  { id: 1, name: 'House Blend', arabica: 80, robusta: 20, profileDescription: 'Chocolate', price: 12.90, link: 'https://test.com', createdAt: '2024-01-15T10:00:00Z' },
  { id: 2, name: 'Ethiopian', arabica: 100, robusta: 0, profileDescription: 'Floral', price: 16.90, link: 'https://test2.com', createdAt: '2024-01-20T10:00:00Z' },
]

vi.mock('../composables/useGraphQL', () => ({
  useGraphQL: () => {
    const loading = ref(true)
    const error = ref(null)
    const request = vi.fn().mockImplementation(async () => {
      const result = { coffees: mockCoffees }
      loading.value = false
      return result
    })
    return { loading, error, request }
  },
}))

describe('CoffeeListView', () => {
  it('renders without crashing', () => {
    const wrapper = mount(CoffeeListView)
    expect(wrapper.exists()).toBe(true)
  })

  it('displays loading state initially', () => {
    const wrapper = mount(CoffeeListView)
    expect(wrapper.text()).toContain('Loading')
  })

  it('displays coffee names', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('House Blend')
    expect(wrapper.text()).toContain('Ethiopian')
  })

  it('displays arabica/robusta combined', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('80/20')
    expect(wrapper.text()).toContain('100/0')
  })

  it('displays price with euro sign', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('12.90 €')
    expect(wrapper.text()).toContain('16.90 €')
  })

  it('displays table headers', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('Name')
    expect(wrapper.text()).toContain('Arabica/Robusta')
    expect(wrapper.text()).toContain('Price')
  })

it('displays external link icon', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.html()).toContain('Visit')
  })
})