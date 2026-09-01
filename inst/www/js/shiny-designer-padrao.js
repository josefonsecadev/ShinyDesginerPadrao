(function () {
  function getDirectToggle(dropdown) {
    var children = dropdown.children;

    for (var index = 0; index < children.length; index += 1) {
      if (children[index].classList.contains("dropdown-toggle")) {
        return children[index];
      }
    }

    return null;
  }

  function closeDropdown(dropdown) {
    var menu = dropdown.querySelector(":scope > .dropdown-menu");
    var toggle = getDirectToggle(dropdown);

    dropdown.classList.add("sdp-navbar__dropdown--fechado");
    dropdown.classList.remove("open");

    if (menu) {
      menu.classList.remove("show");
      menu.removeAttribute("data-bs-popper");
    }

    if (toggle) {
      toggle.classList.remove("show");
      toggle.setAttribute("aria-expanded", "false");
    }
  }

  document.addEventListener("click", function (event) {
    if (!event.target || typeof event.target.closest !== "function") {
      return;
    }

    var link = event.target.closest(".sdp-navbar .dropdown-menu a");

    if (!link) {
      return;
    }

    var dropdown = link.closest(".sdp-navbar li.dropdown");

    if (dropdown) {
      closeDropdown(dropdown);
      window.setTimeout(function () {
        closeDropdown(dropdown);
      }, 0);
    }
  });

  document.addEventListener("mouseenter", function (event) {
    var dropdown = event.target.closest(".sdp-navbar li.dropdown");

    if (dropdown &&
        dropdown.classList.contains("sdp-navbar__dropdown--fechado") &&
        !event.target.closest(".dropdown-menu a")) {
      dropdown.classList.remove("sdp-navbar__dropdown--fechado");
    }
  }, true);

  document.addEventListener("focusin", function (event) {
    var dropdown = event.target.closest(".sdp-navbar li.dropdown");

    if (dropdown && dropdown.classList.contains("sdp-navbar__dropdown--fechado")) {
      dropdown.classList.remove("sdp-navbar__dropdown--fechado");
    }
  });

  document.addEventListener("mouseleave", function (event) {
    var dropdown = event.target.closest(".sdp-navbar li.dropdown");

    if (dropdown && !dropdown.contains(event.relatedTarget)) {
      dropdown.classList.remove("sdp-navbar__dropdown--fechado");
    }
  }, true);
})();
