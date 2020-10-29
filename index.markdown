---
layout: default
---

<header>
  <h1>{{ site.title }}</h1>

  {% if site.theme_config.show_description == true %}
    <p>{{ site.description }}</p>
  {% endif %}

  <p>
    If you'd like to add yourself to the site, please check out the repository and <a href="https://github.com/zatech/freelancers">README.md</a> on GitHub.
  </p>
</header>

{% for cat in site.categories %}
  {% assign category = cat[0] %}
  <ul>
    {% assign people = site.categories[category] | sort_natural: "name" %}
    {% for post in people %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.name }}</a>:
        <small>{{ post.skillset }}</small>
      </li>
    {% endfor %}
  </ul>
{% endfor %}
