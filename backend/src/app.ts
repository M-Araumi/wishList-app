import { Hono } from "hono";
import { cors } from "hono/cors";

const app = new Hono();

app.use("*", cors({
  origin: "http://localhost:3001",
}));

app.get("/health", (c) => {
  return c.json({ status: "ok" });
});

export default app;