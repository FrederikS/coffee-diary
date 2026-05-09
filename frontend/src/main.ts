import "./assets/main.css";

import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import PrimeVue from "primevue/config";
import { definePreset } from "@primevue/themes";
import Aura from "@primevue/themes/aura";

// Define a custom preset that maps our design tokens to PrimeVue's semantic tokens
const CoffeeTheme = definePreset(Aura, {
  semantic: {
    primary: {
      50: "#FEF7E8",
      100: "#FBECC4",
      200: "#F7D88F",
      300: "#F3C45A",
      400: "#EFB025",
      500: "#BA7517",
      600: "#8A5A11",
      700: "#5A3F0B",
      800: "#2C1A0E",
      900: "#1A0F08",
      950: "#0D0804",
    },
    surface: {
      0: "#FFFFFF",
      50: "#FAF7F2",
      100: "#E8E0D5",
      200: "#D4C8B8",
      300: "#BFB09B",
      400: "#A8957C",
      500: "#8B6F5E",
      600: "#6F5347",
      700: "#5A3F0B",
      800: "#2C1A0E",
      900: "#1A0F08",
      950: "#0D0804",
    },
    colorScheme: {
      light: {
        primary: {
          color: "{primary.500}",
          contrastColor: "#FFFFFF",
          hoverColor: "{primary.600}",
          activeColor: "{primary.700}",
        },
        surface: {
          0: "#FFFFFF",
          50: "#FAF7F2",
          100: "#E8E0D5",
        },
        text: {
          color: "#2C1A0E",
          mutedColor: "#8B6F5E",
          hoverColor: "#2C1A0E",
        },
        content: {
          background: "#FFFFFF",
          hoverBackground: "#FAF7F2",
          borderColor: "#E8E0D5",
          color: "#2C1A0E",
          hoverColor: "#2C1A0E",
        },
        highlight: {
          background: "{primary.50}",
          focusBackground: "{primary.100}",
          color: "{primary.700}",
          focusColor: "{primary.800}",
        },
      },
    },
    borderRadius: {
      none: "0",
      xs: "4px",
      sm: "6px",
      md: "10px", // ← default for most components
      lg: "14px",
      xl: "18px",
    },
  },
  components: {
    datatable: {
      borderRadius: "{borderRadius.lg}",
      headerCellBackground: "#FFFFFF",
      headerCellColor: "#2C1A0E",
      headerCellBorderColor: "#E8E0D5",
      bodyRowColor: "#2C1A0E",
      bodyRowAltBackground: "#FAF7F2",
      bodyCellBorderColor: "#E8E0D5",
    },
    rating: {
      iconColor: "#E8E0D5",
      iconActiveColor: "#BA7517",
    },
  },
});

const app = createApp(App);

app.use(router);
app.use(PrimeVue, {
  theme: {
    preset: CoffeeTheme,
    options: {
      // Use CSS variables for better compatibility
      cssLayer: true,
      darkModeSelector: "system",
    },
  },
});

app.mount("#app");
