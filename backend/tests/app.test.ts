
import { describe, expect, it } from "vitest";
import app from "../src/app.js";

describe("GET /health", () => {
  it("正常なレスポンスを返す", async () => {
    const response = await app.request("/health");

    expect(response.status).toBe(200);
    await expect(response.json()).resolves.toEqual({
      status: "ok",
    });
  });
});
