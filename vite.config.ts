import {defineConfig} from "vite";
import path from "path";
import watch from "rollup-plugin-watch";
import PurgeIcons from 'vite-plugin-purge-icons'


export default defineConfig({
    plugins: [watch({dir: "./", exclude: ["dist", "node_modules"]}), PurgeIcons({
        content: [
            './module/*.ftl',
        ],
    })],
    build: {
        lib: {
            entry: path.resolve(__dirname, "src/main.ts"),
            name: "main",
            fileName: "main",
            formats: ["umd"],
        },
    },
});
