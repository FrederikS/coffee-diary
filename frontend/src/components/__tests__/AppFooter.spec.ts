import { describe, it, expect, beforeEach } from 'vitest'

import { mount } from '@vue/test-utils'
import AppFooter from '../AppFooter.vue'

describe('AppFooter', () => {
  beforeEach(function () {
    // Reset VITE_APP_VERSION before each test
    import.meta.env.VITE_APP_VERSION = ''
  })

  it('renders version when VITE_APP_VERSION is defined', () => {
    import.meta.env.VITE_APP_VERSION = 'v1.2.3'
    const wrapper = mount(AppFooter)
    expect(wrapper.text()).toContain('1.2.3')
    expect(wrapper.find('footer').exists()).toBe(true)
  })

  it('renders dev when VITE_APP_VERSION is not provided', () => {
    import.meta.env.VITE_APP_VERSION = ''
    const wrapper = mount(AppFooter)
    expect(wrapper.find('footer').exists()).toBe(true)
    expect(wrapper.text()).toContain('dev')
  })

  it('renders version without v prefix', () => {
    import.meta.env.VITE_APP_VERSION = '1.0.0'
    const wrapper = mount(AppFooter)
    expect(wrapper.text()).toContain('1.0.0')
  })
})