import { defineConfig } from "vite";
import { fileURLToPath } from "url";
import path from "path";
// vite.config.js
import PurgeIcons from "vite-plugin-purge-icons";
import Unfonts from "unplugin-fonts/vite";

export default defineConfig({
  plugins: [
    PurgeIcons({
      content: ["./templates/*.html"],
    }),
    Unfonts({
      custom: {
        /**
         * Fonts families lists
         */
        families: [
          {
            /**
             * Name of the font family.
             */
            name: "Meslo LG",
            /**
             * Local name of the font. Used to add `src: local()` to `@font-rule`.
             */
            local: "Meslo LG S",
            /**
             * Regex(es) of font files to import. The names of the files will
             * predicate the `font-style` and `font-weight` values of the `@font-rule`'s.
             */
            src: "./src/assets/fonts/meslo-LG/MesloLGS-Regular.ttf",
          },
        ],

        /**
         * Defines the default `font-display` value used for the generated
         * `@font-rule` classes.
         */
        display: "auto",

        /**
         * Using `<link rel="preload">` will trigger a request for the WebFont
         * early in the critical rendering path, without having to wait for the
         * CSSOM to be created.
         */
        preload: true,

        /**
         * Using `<link rel="prefetch">` is intended for prefetching resources
         * that will be used in the next navigation/page load
         * (e.g. when you go to the next page)
         *
         * Note: this can not be used with `preload`
         */
        prefetch: false,
      },
    }),
  ],
  build: {
    outDir: fileURLToPath(new URL("./templates/assets/dist", import.meta.url)),
    emptyOutDir: true,

    lib: {
      entry: path.resolve(__dirname, "src/main.ts"),
      name: "main",
      fileName: "main",
      formats: ["iife"],
    },
  },
});
