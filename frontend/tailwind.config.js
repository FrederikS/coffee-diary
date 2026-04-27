/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        cream: '#FAF7F2',
        espresso: '#2C1A0E',
        amber: '#BA7517',
        latte: '#8B6F5E',
        oat: '#E8E0D5',
        slate: '#5F5E5A',
        surface: '#FFFFFF',
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
      },
      fontSize: {
        'eyebrow': ['11px', { letterSpacing: '0.07em' }],
      },
      borderRadius: {
        'card': '12px',
        'badge': '99px',
      },
    },
  },
  plugins: [],
}