import { mount, type MountingOptions } from '@vue/test-utils'
import PrimeVue from 'primevue/config'
import Aura from '@primevue/themes/aura'

// Extend the mount function to include PrimeVue plugin
const originalMount = mount

// Create a custom mount function that includes PrimeVue
export function mountWithPrimeVue(component: any, options?: MountingOptions<any>) {
  return originalMount(component, {
    ...options,
    global: {
      ...options?.global,
      plugins: [
        [PrimeVue, { theme: { preset: Aura } }],
        ...(options?.global?.plugins || [])
      ]
    }
  })
}

// Also provide a way to use the original mount if needed
export { originalMount as mount }