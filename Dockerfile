# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Actualiza el sistema e instala dependencias necesarias
RUN apt-get update && apt-get install -y \
  curl \
  git \
  gnupg \
  lsb-release \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

# Instala Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs

# Instala el paquete `yarn` (opcional, si prefieres usar Yarn en vez de npm)
RUN npm install --global yarn

# Copia los archivos del proyecto al contenedor
COPY . /app

# Instala las dependencias de React (definidas en package.json)
RUN npm install

# Expone el puerto en el que la aplicación React se ejecuta
EXPOSE 3000

# Comando para ejecutar la aplicación React (el servidor de desarrollo)
CMD ["npm", "start"]
