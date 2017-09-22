# FuturamaCharacters
Demo App for SwiftMN Animations talk. September 2017


## About the project

This App is a simple tableView with a list of Futurama characters. When you tap on one of the cells a new viewController is presented with details about that character. The commits in this repo are structured to walk you through building up animations to transition from the `MainViewController` to `DetailViewController` and back.

## Working through the process

### Initial Project

Checkout the base app to familiarize yourself with the code

    git checkout 442ce5de2b349d8c650c89895e2d816d21e7f5aa

### Animate from cell to detail view

Using `UIViewControllerTransitioningDelegate` and a custom `UIViewControllerAnimatedTransitioning` object, we add an animation from the selected cell to the detail view. 

[diff](https://github.com/SwiftMN/FuturamaCharacters/commit/d0dbde4146d5d8c874c0da4ccb015d6f8b2d5aad)

    git checkout d0dbde4146d5d8c874c0da4ccb015d6f8b2d5aad

### Animate from detail view back to cell

Expanding on the `TransitionAnimator` object that we created, we make our animation reversible for when the detail view is dismissed. 

[diff](https://github.com/SwiftMN/FuturamaCharacters/commit/acbc1cd14932ff9e182f0c1fdebee8c2f15e3f14)

    git checkout acbc1cd14932ff9e182f0c1fdebee8c2f15e3f14

### Add blur effect

To make the transition a little smoother we add a blur effect to the tableView, and animate it in and out along with the transition. 

[diff](https://github.com/SwiftMN/FuturamaCharacters/commit/0ef83413bba49719d2e94e8456c5737d092fc5e1)

    git checkout 0ef83413bba49719d2e94e8456c5737d092fc5e1

### Animate description

The transition is pretty smooth, but that desctiption popping in is pretty jarring. Let's try to make that smooth, too. 

[diff](https://github.com/SwiftMN/FuturamaCharacters/commit/1687c50d917161a3249a5b4d19bd690817c94a8c)

    git checkout 1687c50d917161a3249a5b4d19bd690817c94a8c

### Animate description independently of other views using keyframes

The description is animating in, but if you look closely, it moves a bit as it fades in. Using keyframes we can animate the view in and then fade the description in. Likewise, we can fade the description out before animating the view back to the cell. 

[diff](https://github.com/SwiftMN/FuturamaCharacters/commit/fa26ad81b0c9289aed452928283927333acdb588)

    git checkout fa26ad81b0c9289aed452928283927333acdb588



