const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Book = sequelize.define('Book', {
  book_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  seller_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  category_id: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  images_id: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  isbn_code: {
    type: DataTypes.STRING,
    allowNull: true
  },
  condition: {
    type: DataTypes.STRING,
    allowNull: true,
    field: 'condition'
  },
  publication_date: {
    type: DataTypes.STRING,
    allowNull: true,
    field: 'publication_date'
  },
  googleBooksId: {
    type: DataTypes.STRING,
    unique: true,
    allowNull: true,
    field: 'googlebooksid'
  },
  title: {
    type: DataTypes.STRING,
    allowNull: false,
    field: 'title'
  },
  authors: {
    type: DataTypes.JSON,
    allowNull: false,
    defaultValue: []
  },
  description: {
    type: DataTypes.TEXT('long'),
    allowNull: true
  },
  publishedDate: {
    type: DataTypes.STRING,
    allowNull: true
  },
  isbn: {
    type: DataTypes.STRING,
    allowNull: true
  },
  pageCount: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  imageUrl: {
    type: DataTypes.STRING(1000),
    allowNull: true
  },
  coverImageUrl: {
    type: DataTypes.STRING(1000),
    allowNull: true
  },
  categories: {
    type: DataTypes.JSON,
    allowNull: true,
    defaultValue: []
  },
  language: {
    type: DataTypes.STRING,
    allowNull: true
  },
  averageRating: {
    type: DataTypes.FLOAT,
    allowNull: true
  },
  quantity: {
    type: DataTypes.INTEGER,
    defaultValue: 1
  },
  available: {
    type: DataTypes.BOOLEAN,
    defaultValue: true
  },
  price: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    defaultValue: 99.99
  },
  publisher: {
    type: DataTypes.STRING,
    allowNull: true
  }
}, {
  tableName: 'books', // Nombre de tabla explícito para PostgreSQL
  timestamps: true
}, {
  tableName: 'books',
  freezeTableName: true
});

module.exports = Book; 