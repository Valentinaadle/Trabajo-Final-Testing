const { Sequelize } = require('sequelize');


const sequelize = new Sequelize({
  dialect: 'postgres', // Cambiado de 'mysql' a 'postgres' para Supabase
  host: process.env.DB_HOST || 'localhost',
  username: process.env.DB_USER || 'postgres', // Usuario por defecto de Supabase
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'bookloop',
  port: process.env.DB_PORT || 5432, // Puerto por defecto PostgreSQL
  logging: false
});

const connectDB = async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexión a la base de datos establecida correctamente.');
    
    // Sincronizar los modelos con la base de datos
    // await sequelize.sync({ alter: true }); // Desactivado para evitar duplicación de índices
    console.log('Base de datos sincronizada.');
  } catch (error) {
    console.error('Error al conectar con la base de datos:', error);
    throw error;
  }
};

module.exports = {
  sequelize,
  connectDB
}; 