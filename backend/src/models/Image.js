const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Image = sequelize.define('Image', {
  image_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  book_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  image_url: {
    type: DataTypes.TEXT('long'),
    allowNull: false
  }
}, {
  tableName: 'images', // Forzar uso de tabla en minúscula
  timestamps: false
});

module.exports = Image; 