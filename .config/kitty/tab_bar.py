def draw_title(data):
    title = data["title"]

    # truncate title to 20 characters
    if len(title) >= 20:
        # \u2026 is an ellipsis
        title = f"{title[0:19]}\u2026"

    return f"{title}"

