import os
import random
import re
import sys

DAMPING = 0.85
SAMPLES = 10000


def main():
    if len(sys.argv) != 2:
        sys.exit("Usage: python pagerank.py corpus")
    corpus = crawl(sys.argv[1])
    ranks = sample_pagerank(corpus, DAMPING, SAMPLES)
    print(f"PageRank Results from Sampling (n = {SAMPLES})")
    for page in sorted(ranks):
        print(f"  {page}: {ranks[page]:.4f}")
    ranks = iterate_pagerank(corpus, DAMPING)
    print(f"PageRank Results from Iteration")
    for page in sorted(ranks):
        print(f"  {page}: {ranks[page]:.4f}")


def crawl(directory):
    """
    Parse a directory of HTML pages and check for links to other pages.
    Return a dictionary where each key is a page, and values are
    a list of all other pages in the corpus that are linked to by the page.
    """
    pages = dict()

    # Extract all links from HTML files
    for filename in os.listdir(directory):
        if not filename.endswith(".html"):
            continue
        with open(os.path.join(directory, filename)) as f:
            contents = f.read()
            links = re.findall(r"<a\s+(?:[^>]*?)href=\"([^\"]*)\"", contents)
            pages[filename] = set(links) - {filename}

    # Only include links to other pages in the corpus
    for filename in pages:
        pages[filename] = set(
            link for link in pages[filename]
            if link in pages
        )

    return pages


def transition_model(corpus, page, damping_factor):
    """
    Return a probability distribution over which page to visit next,
    given a current page.

    With probability `damping_factor`, choose a link at random
    linked to by `page`. With probability `1 - damping_factor`, choose
    a link at random chosen from all pages in the corpus.
    """
    probs = {p:(1-damping_factor)/len(corpus) for p in corpus}
    for q in corpus[page]:
        probs[q] += damping_factor / len(corpus[page])
    return probs
    #raise NotImplementedError


def sample_pagerank(corpus, damping_factor, n):
    """
    Return PageRank values for each page by sampling `n` pages
    according to transition model, starting with a page at random.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """
    pages = [page for page in corpus]
    pageranks = {page:0 for page in pages}
    page = random.choice(pages)
    pageranks[page] = 1
    for i in range(n):
        probs = transition_model(corpus, page, damping_factor)
        probs = probs.values() #[probs[p] for p in pages]
        page = random.choices(pages, weights=probs, k=1)[0]
        pageranks[page] += 1
    return {page:pageranks[page]/n for page in pageranks}
    #raise NotImplementedError


def iterate_pagerank(corpus, damping_factor):
    """
    Return PageRank values for each page by iteratively updating
    PageRank values until convergence.

    Return a dictionary where keys are page names, and values are
    their estimated PageRank value (a value between 0 and 1). All
    PageRank values should sum to 1.
    """
    incoming = {p:set() for p in corpus}
    for p in corpus:
        for q in corpus[p]:
           incoming[q].add(p)
    pages = [page for page in corpus]
    n = len(pages)
    pageranks = {page:1/n for page in pages}
    diff = float('inf')
    while diff > 0.001:
        diff = 0
        for page in pages:
            p = (1-damping_factor)/n
            for q in incoming[page]:
               p += damping_factor * (sum([pageranks[q]/len(corpus[q])]) if len(corpus[q]) > 0 else 1/n)
            diff = max(diff, abs(pageranks[page]-p))
            pageranks[page] = p   
    return {p:pageranks[p]/sum(pageranks.values()) for p in pageranks}		
    #raise NotImplementedError


if __name__ == "__main__":
    main()
