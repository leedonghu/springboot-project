<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    /* CSS Document */

.rating-radio label {
  display: block;
}

.rating-radio svg g[role="radio"] {
  color: #005a9c;
}

.rating-radio svg {
  forced-color-adjust: auto;
  touch-action: pan-y;
}

.rating-radio svg .focus-ring,
.rating-radio svg .focus-ring-none {
  stroke-width: 0;
  fill-opacity: 0;
}

.rating-radio svg .star {
  stroke-width: 2px;
  stroke: currentcolor;
  fill-opacity: 0;
}

.rating-radio svg .star-none {
  stroke-width: 3px;
  stroke: currentcolor;
  fill-opacity: 0;
}

.rating-radio[data-rating-value="5"] svg .star {
  fill: currentcolor;
  fill-opacity: 1;
}

.rating-radio[data-rating-value="1"] svg .star-1 .star {
  fill: currentcolor;
  fill-opacity: 1;
}

.rating-radio[data-rating-value="2"] svg .star-2 .star {
  fill: currentcolor;
  fill-opacity: 1;
}

.rating-radio[data-rating-value="3"] svg .star-3 .star {
  fill: currentcolor;
  fill-opacity: 1;
}

.rating-radio[data-rating-value="4"] svg .star-4 .star {
  fill: currentcolor;
  fill-opacity: 1;
}

/* focus styling */

.rating-radio:focus {
  outline: none;
}

.rating-radio svg g:focus {
  outline: none;
}

.rating-radio svg g:focus .focus-ring {
  stroke-width: 2px;
  stroke: currentcolor;
}

.rating-radio:hover {
  cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>
    <div class="rating-radio"
     role="radiogroup"
     aria-labelledby="id-rating-label"
     data-rating-value="">
  <div id="id-rating-label" class="label">
    Rating
  </div>
  <svg role="none"
       xmlns="http://www.w3.org/2000/svg"
       width="264"
       height="48">
    <defs>
      <g id="star">
        <polygon points="2.0,13.4 11.7,20.5 8.0,31.1 17.7,24.8 27.4,31.9 23.7,20.5 33.4,13.4 21.4,13.4 17.7,2.0 14.0,13.4"></polygon>
      </g>
      <g id="focus-ring">
        <rect width="40"
              height="38"
              rx="4"></rect>
      </g>
    </defs>
    <g role="radio"
       aria-checked="false"
       tabindex="-1"
       data-rating="1"
       aria-label="one star"
       class="star-1 star-2 star-3 star-4 star-5">
      <use class="star"
           xlink:href="#star"
           x="10"
           y="7"></use>
      <use class="focus-ring"
           xlink:href="#focus-ring"
           x="8"
           y="5"></use>
    </g>
    <g role="radio"
       aria-checked="false"
       tabindex="-1"
       data-rating="2"
       aria-label="two stars"
       class="star-2 star-3 star-4 star-5">
      <use class="star"
           xlink:href="#star"
           x="50"
           y="7"></use>
      <use class="focus-ring"
           xlink:href="#focus-ring"
           x="48"
           y="5"></use>
    </g>
    <g role="radio"
       aria-checked="false"
       tabindex="-1"
       data-rating="3"
       aria-label="three stars"
       class="star-3 star-4 star-5">
      <use class="star"
           xlink:href="#star"
           x="90"
           y="7"></use>
      <use class="focus-ring"
           xlink:href="#focus-ring"
           x="88"
           y="5"></use>
    </g>
    <g role="radio"
       aria-checked="false"
       tabindex="-1"
       data-rating="4"
       aria-label="four stars"
       class="star-4 star-5">
      <use class="star"
           xlink:href="#star"
           x="130"
           y="7"></use>
      <use class="focus-ring"
           xlink:href="#focus-ring"
           x="128"
           y="5"></use>
    </g>
    <g role="radio"
       aria-checked="false"
       tabindex="-1"
       data-rating="5"
       aria-label="five stars"
       class="star-5">
      <use class="star"
           xlink:href="#star"
           x="170"
           y="7"></use>
      <use class="focus-ring"
           xlink:href="#focus-ring"
           x="168"
           y="5"></use>
    </g>
  </svg>
</div>
</body>
<script>
    /*
 *   This content is licensed according to the W3C Software License at
 *   https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document
 *
 *   File:   radio-rating.js
 *
 *   Desc:   Radio group widget that implements ARIA Authoring Practices
 */

'use strict';

class RatingRadioGroup {
  constructor(groupNode) {
    this.groupNode = groupNode;

    this.radioButtons = [];

    this.firstRadioButton = null;
    this.lastRadioButton = null;

    var rbs = this.groupNode.querySelectorAll('[role=radio]');

    for (var i = 0; i < rbs.length; i++) {
      var rb = rbs[i];

      rb.tabIndex = -1;
      rb.setAttribute('aria-checked', 'false');

      rb.addEventListener('keydown', this.handleKeydown.bind(this));
      rb.addEventListener('click', this.handleClick.bind(this));

      this.radioButtons.push(rb);

      if (!this.firstRadioButton) {
        this.firstRadioButton = rb;
      }
      this.lastRadioButton = rb;
    }

    var value = groupNode.getAttribute('data-rating-value');
    var index = parseInt(value);

    if (value && index >= 0 && index < this.radioButtons.length) {
      this.radioButtons[index].tabIndex = 0;
    } else {
      value = this.firstRadioButton.getAttribute('data-rating-value');
      groupNode.getAttribute('data-rating-value', value);
      this.firstRadioButton.tabIndex = 0;
    }
  }

  setChecked(currentItem) {
    this.groupNode.tabIndex = -1;
    for (var i = 0; i < this.radioButtons.length; i++) {
      var rb = this.radioButtons[i];
      rb.setAttribute('aria-checked', 'false');
      rb.tabIndex = -1;
    }
    this.currentValue = currentItem.getAttribute('data-rating');
    this.groupNode.setAttribute('data-rating-value', this.currentValue);

    currentItem.setAttribute('aria-checked', 'true');
    currentItem.tabIndex = 0;
    currentItem.focus();
  }

  setCheckedToPreviousItem(currentItem) {
    var index;

    if (currentItem === this.firstRadioButton) {
      this.setChecked(this.lastRadioButton);
    } else {
      index = this.radioButtons.indexOf(currentItem);
      this.setChecked(this.radioButtons[index - 1]);
    }
  }

  setCheckedToNextItem(currentItem) {
    var index;

    if (currentItem === this.lastRadioButton) {
      this.setChecked(this.firstRadioButton);
    } else {
      index = this.radioButtons.indexOf(currentItem);
      this.setChecked(this.radioButtons[index + 1]);
    }
  }

  /* EVENT HANDLERS */

  handleKeydown(event) {
    var tgt = event.currentTarget,
      flag = false;

    switch (event.key) {
      case ' ':
      case 'Enter':
        this.setChecked(tgt);
        flag = true;
        break;

      case 'Up':
      case 'ArrowUp':
      case 'Left':
      case 'ArrowLeft':
        this.setCheckedToPreviousItem(tgt);
        flag = true;
        break;

      case 'Down':
      case 'ArrowDown':
      case 'Right':
      case 'ArrowRight':
        this.setCheckedToNextItem(tgt);
        flag = true;
        break;

      default:
        break;
    }

    if (flag) {
      event.stopPropagation();
      event.preventDefault();
    }
  }

  handleClick(event) {
    this.setChecked(event.currentTarget);
  }
}

// Initialize radio button group

window.addEventListener('load', function () {
  var radios = document.querySelectorAll('.rating-radio');
  for (var i = 0; i < radios.length; i++) {
    new RatingRadioGroup(radios[i]);
  }
});
</script>
</html>
