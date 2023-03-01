import "./assets/colors/white.css";
import "./assets/colors/light.css";
import "./assets/colors/dark.css";
import "./assets/main.js";
import "./styles/main.css";
import "@purge-icons/generated";

import { unified } from "unified";
import parse from "rehype-parse";
import slug from "rehype-slug";
import toc, { HtmlElementNode } from "@jsdevtools/rehype-toc";
import stringify from "rehype-stringify";

export const generateTOC = async (inputHTML: string, targetDomSelector: string) => {
  // Create a Rehype processor with the TOC plugin
  const processor = unified()
    .use(parse)
    .use(slug)
    .use(toc, {
      cssClasses: {
        list: "toc-child",
        toc: "toc",
        link: "toc-link",
        listItem: "toc-item",
      },
      customizeTOC: function (t: HtmlElementNode) {
        // @ts-ignore
        const children = t.children?.flatMap((item) => item.children);

        return {
          type: "element",
          tagName: "ol",
          properties: {
            id: "toc-container",
            className: "toc",
          },
          children: children,
        };
      },
      customizeTOCItem(tocItem, heading) {
        let headingNumber = parseInt(heading.tagName.slice(-1), 10);
        let depth = headingNumber
        return {
          type: "element",
          tagName: "li",
          properties: {
            className: `toc-item toc-level-${headingNumber}`,
          },
          children: [
            {
              ...tocItem.children[0],
              children: [
                {
                  type: "element",
                  tagName: "span",
                  properties: {
                    class: "toc-number",
                  },
                  children: [{
                    type: "text",
                    value: `${depth++}.`
                  }]
                },
                {
                  type: "element",
                  tagName: "span",
                  properties: {
                    class: "toc-text",
                  },
                  // @ts-ignore
                  children: [...tocItem.children[0].children],
                },
              ],
            },
            ...tocItem.children.slice(1),
          ],
        };
      },
    })
    .use(stringify);

  // Process the HTML, adding heading IDs and Table of Contents
  const outputHTML = await processor.process(inputHTML);
  const targetDom = document.querySelector(targetDomSelector);
  if (targetDom) {
    const doc = document.createRange().createContextualFragment(outputHTML.toString());
    // @ts-ignore
    targetDom.appendChild(doc.getElementById("toc-container"));
  }
};
