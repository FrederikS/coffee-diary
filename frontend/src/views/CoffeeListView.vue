<script setup lang="ts">
import { ref, onMounted } from "vue";
import { useGraphQL } from "../composables/useGraphQL";
import { GET_COFFEES } from "../queries/getCoffees";
import Button from 'primevue/button';
import Card from "primevue/card";
import ProgressSpinner from "primevue/progressspinner";
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import Chip from "primevue/chip";
import Rating from "primevue/rating";

interface Roastery {
  id: number;
  name: string;
}

interface CoffeeType {
  id: number;
  value: string;
}

interface Country {
  id: number;
  name: string;
}

interface ProfileTag {
  id: number;
  value: string;
}

interface Image {
  id: number;
  sourceUrl: string;
}

interface DrinkType {
  id: number;
  value: string;
}

interface RatingType {
  id: number;
  rating: number;
  drinkType: DrinkType | null;
}

interface Coffee {
  id: number;
  name: string;
  arabica: number;
  robusta: number;
  profileDescription: string;
  price: number;
  link: string;
  createdAt: string;
  roastery: Roastery | null;
  type: CoffeeType | null;
  countries: Country[];
  profileTags: ProfileTag[];
  images: Image[];
  ratings: RatingType[];
}

const coffees = ref<Coffee[]>([]);
const { loading, error, request } = useGraphQL();

onMounted(async () => {
  const data = await request<{ coffees: Coffee[] }>(GET_COFFEES);
  // Calculate average rating (0-10 scale) then convert to stars (0-5 scale) by dividing by 2
  coffees.value = data.coffees.map((coffee) => ({
    ...coffee,
    averageRating:
      coffee.ratings && coffee.ratings.length > 0
        ? coffee.ratings.reduce((sum, r) => sum + r.rating, 0) / coffee.ratings.length / 2
        : 0,
  }));
});

function formatPrice(price: string | number): string {
  const num = typeof price === "string" ? parseFloat(price) : price;
  return `${num.toFixed(2)} €`;
}

function formatCountries(countries: Country[]): string {
  if (!countries || countries.length === 0) return "-";
  return countries.map((c) => c.name).join(", ");
}

function formatProfileTags(tags: ProfileTag[]): string {
  if (!tags || tags.length === 0) return "-";
  return tags.map((t) => t.value).join(", ");
}

function getAverageRating(ratings: RatingType[]): number {
  if (!ratings || ratings.length === 0) return 0;
  return ratings.reduce((sum, r) => sum + r.rating, 0) / ratings.length / 2;
}
</script>

<template>
  <div class="max-w-[1300px] mx-auto px-4 sm:px-8 py-8">
    <Card>
      <template #title><h2 class="text-center text-3xl">Coffees</h2></template>
      <template #content>
        <div v-if="loading" class="flex justify-center items-center py-8">
          <ProgressSpinner />
        </div>

        <p v-else-if="error">
          {{ error }}
        </p>
        <template v-else-if="coffees.length === 0">
          <p>No coffees found</p>
        </template>
        <DataTable v-else :value="coffees" sortable filterDisplay="menu" paginator :rows="10">
          <Column field="name" header="Name" sortable filter showSortMenu />
          <Column
            field="roastery.name"
            header="Roastery"
            sortable
            filter
            showSortMenu
            showFilterMenu
          />
          <Column field="type.value" header="Type" sortable filter showSortMenu showFilterMenu />
          <Column field="countries" header="Origins" filter showSortMenu showFilterMenu>
            <template #body="{ data }">
              {{ formatCountries(data.countries) }}
            </template>
          </Column>
          <Column field="profileTags" header="Profile" filter showSortMenu showFilterMenu>
            <template #body="{ data }">
              <Chip v-for="tag in data.profileTags" :key="tag.id" :label="tag.value" class="py-1 m-1" />
            </template>
          </Column>
          <Column field="averageRating" header="Rating" sortable showSortMenu>
            <template #body="{ data }">
              <div v-if="getAverageRating(data.ratings) > 0" class="flex items-center gap-2">
                <Rating
                  :modelValue="getAverageRating(data.ratings)"
                  :readonly="true"
                  :cancel="false"
                />
                <span>{{ getAverageRating(data.ratings).toFixed(1) }}</span>
              </div>
              <span v-else>-</span>
            </template>
          </Column>
          <Column field="price" header="Price" sortable showSortMenu>
            <template #body="{ data }">
              {{ formatPrice(data.price) }}
            </template>
          </Column>
          <Column field="link" header="Link" toggleable>
            <template #body="{ data }">
              <Button as="a" label="Visit" :href="data.link" target="_blank" rel="noopener noreferrer" />
            </template>
          </Column>
        </DataTable>
      </template>
    </Card>
  </div>
</template>
