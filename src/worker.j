
// Modules syntax (same as your Hello World), with proxy to GitHub Pages
export default {
  async fetch(request, env, ctx) {
    // Path forwarding: keep any path/query user requests
    const url = new URL(request.url);
    const target = new URL(`https://orbital4u.github.io/Skill-Based-Contest${url.pathname}${url.search}`);

    // Optional: set cache for static content
    const res = await fetch(target.toString(), {
      headers: {
        // Forward essential headers (optional)
        'User-Agent': request.headers.get('User-Agent') || 'Cloudflare-Worker',
      },
    });

    // Return response as-is
    return res;
  }
}
