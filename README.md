# BookLoop - Sistema de Gestión de Biblioteca

---

## 🚀 Despliegue gratuito: Vercel + Railway + Supabase

### ¿Cómo tener BookLoop online, gratis y sin sorpresas?

**Frontend:** [Vercel](https://vercel.com/)  
**Backend:** [Railway](https://railway.app/)  
**Base de datos:** [Supabase](https://supabase.com/) (PostgreSQL)

### Checklist para NO PAGAR
- Usá siempre los planes gratuitos (Free Tier) de cada plataforma.
- No subas archivos grandes (imágenes, videos) a Railway o Supabase.
- Apagá/eliminá proyectos viejos o que no uses.
- Revisá el dashboard de cada servicio para ver el uso.
- En Vercel y Railway, no dejes servicios corriendo 24/7 si no es necesario.
- ¡Nunca expongas claves privadas en el frontend!

### Ejemplo de variables de entorno

**Frontend (`/frontend/.env`):**
```env
REACT_APP_API_URL=trabajo-final-testing-production.up.railway.app
```
(No barra al final)

**Backend (`/backend/.env`):**
```env
DB_HOST=aws-0-sa-east-1.pooler.supabase.com
DB_USER=postgres.zzxgvsjwfzkbcoymnore
DB_PASSWORD=1f2t3b4d5a6d!
DB_NAME=postgres
DB_PORT=5432
DIALECT=postgres

# Email Configuration
EMAIL_USER=itsbookloop@gmail.com
EMAIL_PASSWORD=gcnsizqqkkgwydib
```

### Tips para tus compañeros
- Siempre usar variables de entorno para las URLs y claves.
- Si cambiás una variable en Vercel o Railway, hacé **redeploy**.
- Si ves errores de CORS, revisá los orígenes permitidos en el backend.
- Si algo no carga, revisá la consola del navegador y la pestaña Network.
- Compartí este README y tu .env.example para que todos puedan configurar igual.

---


Este proyecto es un sistema de gestión de biblioteca que permite administrar libros, préstamos y usuarios.

## Estructura del Proyecto

El proyecto está dividido en dos partes principales:

### Backend (/backend)
- API REST construida con Node.js y Express
- Base de datos MySQL con Sequelize ORM
- Autenticación de usuarios
- Integración con Google Books API

### Frontend (/frontend)
- Interfaz de usuario construida con React
- Diseño responsive
- Gestión de estado con React Hooks
- Integración con la API del backend

## Requisitos

- Node.js v14 o superior
- MySQL 8.0
- npm o yarn

## Configuración

1. Backend:
```bash
cd backend
npm install
# Crear archivo .env con las variables de entorno necesarias
npm start
```

2. Frontend:
```bash
cd frontend
npm install
# Crear archivo .env con las variables de entorno necesarias
npm start
```

## Variables de Entorno

### Backend (.env)
```env
   # Database Configuration
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=bookloop
   DB_PORT=3306

   # Server Configuration
   PORT=5000

   # Email Configuration
   EMAIL_USER=itsbookloop@gmail.com
   EMAIL_PASSWORD=gcnsizqqkkgwydib

```

### Frontend (.env)
```
REACT_APP_API_URL=http://localhost:5000
```

## Características

- Búsqueda de libros usando Google Books API
- Gestión de inventario de libros
- Sistema de préstamos
- Autenticación de usuarios
- Interfaz intuitiva y responsive

## Desarrollo

El proyecto usa:
- ESLint para linting
- Prettier para formateo de código
- Husky para hooks de git

## Licencia

MIT

# 🛠️ Guía completa de instalación y puesta en marcha de BookLoop

---

## 1. Instalar XAMPP, MySQL y phpMyAdmin

1. **Descargar XAMPP**  
   - Ve a [https://www.apachefriends.org/es/index.html](https://www.apachefriends.org/es/index.html) y descarga XAMPP para tu sistema operativo.

2. **Instalar XAMPP**  
   - Ejecuta el instalador y sigue los pasos recomendados.

3. **Iniciar los servicios necesarios**  
   - Abre el panel de control de XAMPP.
   - Haz clic en **Start** en **MySQL** (y en **Apache** si quieres usar phpMyAdmin).

4. **Abrir phpMyAdmin**  
   - Ve a [http://localhost/phpmyadmin](http://localhost/phpmyadmin) en tu navegador.

---

2. **Instalar dependencias del backend**
   ```bash
   cd backend
   npm install
   ```

3. **Instalar dependencias del frontend**
   ```bash
   cd ../frontend
   npm install
   ```

---

## 3. Configurar variables de entorno

### Backend (.env)
   # Database Configuration
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=bookloop
   DB_PORT=3306

   # Server Configuration
   PORT=5000

   # Email Configuration
   EMAIL_USER=itsbookloop@gmail.com
   EMAIL_PASSWORD=gcnsizqqkkgwydib
```

2. **Frontend (`frontend/.env`)**  
   Crea un archivo `.env` en la carpeta `frontend`:

   ```
   REACT_APP_API_URL=http://localhost:5000
   ```

---

## 4. Importar la base de datos con todos los libros

> **IMPORTANTE:**  
> Para que todos tengan los mismos libros y datos de prueba, es necesario importar el archivo `bookloop.sql` que se encuentra en la raíz del proyecto.

### Pasos para importar la base de datos:

1. Abre **phpMyAdmin** y asegúrate de que el servicio MySQL esté corriendo en XAMPP.
2. Crea una base de datos vacía llamada **`bookloop`** (o el nombre que uses en tu `.env`).
3. Selecciona la base de datos recién creada y ve a la pestaña **"Importar"**.
4. Haz clic en **"Seleccionar archivo"** y elige el archivo `bookloop.sql`.
5. Haz clic en **"Continuar"**.
6. ¡Listo! Ahora tienes todos los libros y datos de prueba en tu entorno local.

---

## 5. Arrancar el backend

1. **Desde la carpeta backend:**
   ```bash
   cd backend
   npx nodemon src/index.js
   ```
   o
   ```bash
   node src/index.js
   ```

   - El backend debe mostrar:  
     `Conexión a la base de datos establecida correctamente.`  
     `Base de datos sincronizada.`  
     `Servidor corriendo en el puerto 5000`

---

## 6. Arrancar el frontend

1. **Desde la carpeta frontend:**
   ```bash
   cd frontend
   npm start
   ```
   - Esto abrirá la app en [http://localhost:3000](http://localhost:3000)

---

## 7. Notas importantes

- **No ejecutar el backend legacy (`backend/app.js`).**  
  Solo usar el backend de `backend/src/index.js`.

- **Si hay problemas de rutas 404 en la búsqueda:**  
  Asegúrate de que la ruta `/search-db` esté antes de `/:id` en `bookRoutes.js`.

- **Si se agregan nuevas dependencias:**  
  Recordar correr `npm install` en la carpeta correspondiente.

- **Para agregar libros:**  
  Usar la funcionalidad de la app o cargar datos manualmente en la base de datos.

---


## 9. Comando rápido para levantar todo

```bash
# En una terminal
cd backend
npx nodemon src/index.js

# En otra terminal
cd frontend
npm start
```

http://192.168.1.30/phpmyadmin

---

## 10. Npm Install nuevos
```
npm install axios
npm install nodemailer
npm install multer


#archivo .env del backend 

   # Database Configuration
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=bookloop
   DB_PORT=3306

   # Server Configuration
   PORT=5000

   # Email Configuration
   EMAIL_USER=itsbookloop@gmail.com
   EMAIL_PASSWORD=gcnsizqqkkgwydib


## 10. Para importar la BD en PHP my admin

En phpMyAdmin, selecciona la base de datos bookloop en el panel izquierdo.
Haz clic en la pestaña “Operaciones”.
Busca la opción “Eliminar la base de datos (DROP)” y haz clic en “Eliminar la base de datos”.
Confirma la eliminación.
Crea una nueva base de datos con el mismo nombre (bookloop).
Selecciona la base de datos recién creada.
Ve a la pestaña “Importar” y sube el archivo .sql.

