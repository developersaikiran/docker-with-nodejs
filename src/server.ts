import express, { Request, Response } from "express";

const app = express();

app.use("/", (req: Request, res: Response) => {
    res.send("Hello, TypeScript with Node.js!");
});

console.log("saikiran");


const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
