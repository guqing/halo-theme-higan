
import { unified } from "unified";
import parse from "rehype-parse";
import slug from "rehype-slug";
import toc, { HtmlElementNode } from "@jsdevtools/rehype-toc";
import stringify from "rehype-stringify";

export const generateTOC = async (inputHTML: string, targetDomSelector: string) => {
  if(!inputHTML) {
    return;
  }
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
    return
  }
  console.warn(`Failed to generate toc to targetDom ${targetDom}, processed html is: ${outputHTML}`)
};
