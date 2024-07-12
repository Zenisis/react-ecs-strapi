// src/Articles.js
import React, { useState, useEffect } from 'react';
import { fetchArticles } from './strapiService';
import './App.css';

const Articles = () => {
  const [articles, setArticles] = useState([]);

  useEffect(() => {
    const getArticles = async () => {
      try {
        const data = await fetchArticles();
        console.log('Fetched Articles:', data);
        setArticles(data);
      } catch (error) {
        console.error('Error fetching articles:', error);
      }
    };

    getArticles();
  }, []);

  return (
    <div>
      <h1>Articles</h1>
      <div className="articles-container">
        {articles.length > 0 ? (
          articles.map((article) => (
            <div key={article.id} className="article-card">
              <h2 className="article-title">{article.title}</h2>
              <p className="article-summary">{article.summary}</p>
              <div
                className="article-content"
                dangerouslySetInnerHTML={{ __html: article.content }}
              />
            </div>
          ))
        ) : (
          <p>No articles found</p>
        )}
      </div>
    </div>
  );
};

export default Articles;
