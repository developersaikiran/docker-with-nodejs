# Step 1: Use the official Node.js image
FROM node:20

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy package.json and package-lock.json, then install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy the rest of the application files
COPY . .

# Step 5: Compile TypeScript to JavaScript
RUN npm install -g typescript
RUN npx tsc

# Step 6: Expose the port your app uses
EXPOSE 3000

# Step 7: Command to start the app
CMD ["node", "dist/server.js"]
