﻿// Created by André Meyer (ameyer@ifi.uzh.ch) from the University of Zurich
// Created: 2015-10-20
// 
// Licensed under the MIT License.

using System;

namespace UserInputTracker
{
    public static class Settings
    {
        public static bool IsEnabledByDefault = true;
        public const int UserInputVisMinutesInterval = 10; // interval for visualizations

        private const int MouseSnapshotIntervalInSeconds = 1;
        public static TimeSpan MouseSnapshotInterval = TimeSpan.FromSeconds(MouseSnapshotIntervalInSeconds);

        internal const int UserInputAggregationIntervalInSeconds = 60; // save one entry every 60 seconds into the database => if changed, make sure to change tsStart and tsEnd in SaveToDatabaseTick
        internal static TimeSpan UserInputAggregationInterval = TimeSpan.FromSeconds(UserInputAggregationIntervalInSeconds);

        public const string DbTableUserInput_v2 = "user_input";
        public const string DbTableKeyboard_v1 = "user_input_keyboard";
        public const string DbTableMouseClick_v1 = "user_input_mouse_click";
        public const string DbTableMouseScrolling_v1 = "user_input_mouse_scrolling";
        public const string DbTableMouseMovement_v1 = "user_input_mouse_movement";

        /////////////////////////////
        // user input level weighting
        /////////////////////////////
        // Keystroke Ratio = 1 (base unit)
        public const int MouseClickKeyboardRatio = 3; // todo: more accurate?
        public const double MouseMovementKeyboardRatio = 0.0028; // todo: more accurate?
        public const double MouseScrollingKeyboardRatio = 1.55; // todo: more accurate?
        //public const double MouseScrollingKeyboardRatio = 0.016;
    }
}
