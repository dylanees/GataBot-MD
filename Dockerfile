# Base actualizada de Node.js
FROM node:20-bullseye

# Instalar dependencias del sistema
RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp git && \
    rm -rf /var/lib/apt/lists/*

# Directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package.json package-lock.json ./

# Instalar dependencias de Node
RUN npm install && npm install qrcode-terminal

# Copiar todos los archivos del bot
COPY . .

# Exponer puerto (si tu bot lo necesita)
EXPOSE 5000

# Comando para ejecutar el bot
CMD ["node", "index.js"]
