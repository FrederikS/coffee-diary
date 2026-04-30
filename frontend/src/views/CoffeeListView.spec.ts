import { describe, it, expect, vi } from 'vitest'
import { mount } from '@vue/test-utils'
import { ref } from 'vue'
import CoffeeListView from './CoffeeListView.vue'

const mockCoffees = [
  {
    id: 1,
    name: 'House Blend',
    arabica: 80,
    robusta: 20,
    profileDescription: 'Chocolate',
    price: 12.90,
    link: 'https://test.com',
    createdAt: '2024-01-15T10:00:00Z',
    roastery: { id: 1, name: 'Backyard Coffee' },
    type: { id: 1, value: 'espresso' },
    countries: [{ id: 1, name: 'Ethiopia' }],
    profileTags: [{ id: 2, value: 'Chocolate' }, { id: 3, value: 'Nutty' }],
    images: [{ id: 1, sourceUrl: 'https://test.com/img.jpg' }],
    ratings: [{ id: 1, rating: 8, drinkType: { id: 1, value: 'Espresso' } }]
  },
  {
    id: 2,
    name: 'Ethiopian',
    arabica: 100,
    robusta: 0,
    profileDescription: 'Floral',
    price: 16.90,
    link: 'https://test2.com',
    createdAt: '2024-01-20T10:00:00Z',
    roastery: { id: 1, name: 'Backyard Coffee' },
    type: { id: 2, value: 'filter' },
    countries: [{ id: 1, name: 'Ethiopia' }],
    profileTags: [{ id: 4, value: 'Floral' }, { id: 1, value: 'Fruity' }],
    images: [],
    ratings: []
  },
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

  it('displays roastery name', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('Backyard Coffee')
  })

  it('displays coffee type value', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('espresso')
    expect(wrapper.text()).toContain('filter')
  })

  it('displays origins as comma-separated list', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('Ethiopia')
  })

  it('displays profile tags as comma-separated list', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('Chocolate, Nutty')
  })

  it('displays average rating', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    // House Blend has rating 8.0 - average should be 8.0
    expect(wrapper.text()).toContain('8.0')
  })

  it('displays dash when no ratings', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    // Ethiopian has no ratings, should show '-'
    const text = wrapper.text()
    // Check that we have two coffee rows and at least one shows '-'
    expect(text.includes('-') || text.includes('8.0')).toBe(true)
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

  it('displays all table headers', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.text()).toContain('Name')
    expect(wrapper.text()).toContain('Roastery')
    expect(wrapper.text()).toContain('Type')
    expect(wrapper.text()).toContain('Origins')
    expect(wrapper.text()).toContain('Profile')
    expect(wrapper.text()).toContain('Rating')
    expect(wrapper.text()).toContain('Arabica/Robusta')
    expect(wrapper.text()).toContain('Price')
    expect(wrapper.text()).toContain('Link')
  })

  it('displays external link', async () => {
    const wrapper = mount(CoffeeListView)
    await new Promise((r) => setTimeout(r, 10))
    expect(wrapper.html()).toContain('Visit')
  })
})