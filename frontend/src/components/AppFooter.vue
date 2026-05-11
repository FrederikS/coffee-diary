<script setup lang="ts">
import Tag from 'primevue/tag'

const version = import.meta.env.VITE_APP_VERSION

// Strip "v" prefix if present
const displayVersion = version ? version.replace(/^v/, '') : "dev"
</script>

<template>
  <footer v-if="displayVersion" class="py-2 text-center text-xs text-surface-500 border-t border-surface-200">
    <Tag :value="displayVersion" severity="secondary" />
  </footer>
</template>