// src/strapiService.js
import axios from 'axios';

const API_URL = 'http://localhost:1337'; // Replace with your Strapi URL

export const fetchArticles = async () => {
  try {
    const response = await axios.get(`${API_URL}/articles`);
    return response.data;
  } catch (error) {
    console.error('Error fetching articles:', error);
    throw error;
  }
};
