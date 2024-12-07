# How to start project using docker

## Step 1: Create a Dockerfile
The Dockerfile is a set of instructions Docker uses to create a container for your app.

**Create a file named Dockerfile:** In the my-node-app folder, create a new file called Dockerfile (no file extension).
**Add the following to the Dockerfile:**

```
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
```


### What does each step mean?

- **FROM node:20:** This tells Docker to use the official Node.js version 20 image as the base.

- **WORKDIR /usr/src/app:** Sets the working directory inside the container where all app files will live.

- **COPY package*.json ./ :** Copy the dependency files (package.json and package-lock.json) into the container.

- **RUN npm install:** Install all the required libraries and tools for the app.

- **COPY . .:** Copy the rest of the app’s code and files into the container.

- **RUN npm install -g typescript:** Install TypeScript so the app can compile .ts files into .js.

- **RUN npx tsc:** Compile the TypeScript code into JavaScript.

- **EXPOSE 3000:** Tell Docker the app will run on port 3000.

- **CMD ["node", "dist/index.js"]:** Run the compiled app when the container starts.


## Step 2: Create a Docker Image
Now, let’s turn your Node.js app into a Docker image.

1. Build the image:
```
docker build -t docker-with-nodejs .
```
- `docker build:` The command to create a Docker image.
- `-t docker-with-nodejs:` Names the image docker-with-nodejs.
- `.:` Tells Docker to use the Dockerfile in the current directory.

2. Check if the image was created:

```
docker images
```


## Step 3: Run the Docker Container
Now that you have a Docker image, you can run it as a container.

1. **Start the container:**
```
docker run -p 3000:3000 docker-with-nodejs
```

- `docker run:` Runs a Docker container.
- `-p 3000:3000:` Maps port 3000 on your computer to port 3000 inside the container.
- `docker-with-nodejs:` Specifies the image to use.

2. **Access your app:** Open your browser and go to http://localhost:3000. You should see “Hello, Dockerized World!” on the screen.

3. **Stop the container:** Press `Ctrl + C` in the terminal to stop the container.

## Run the Container in Detached Mode
If you want the container to keep running in the background, you can use:

```
docker run -d -p 3000:3000 docker-with-nodejs
```
`-d:` Runs the container in **detached** mode.

To stop it later, use:
```
docker ps
docker stop <container-id>
```

Always clean up unused images and containers with:
```
docker system prune
```

----

# Full Blog is available on medium [**Click here**](https://medium.com/@saikirand/how-to-install-docker-and-run-a-node-js-project-a-step-by-step-guide-99ca8a2444a4)