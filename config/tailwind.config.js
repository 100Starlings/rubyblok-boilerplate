const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
	content: [
		"./public/*.html",
		"./app/helpers/**/*.rb",
		"./app/javascript/**/*.js",
		"./app/views/**/*.{erb,haml,html,slim}",
		"./app/views/.liquid",
		"./app/views/**/*",
	],
	theme: {
		extend: {
			colors: {
				green: "#03A79D",
				greenGradient: "rgb(3, 167, 157, 0.10)",
				blue: "#1C75BC",
				gray: " #1F2937",
				blueGradient: "rgb(28, 117, 188, 0.20)",
				white: "#FFFFFF",
				shadedWhite: "rgb(255, 255, 255, 0.66)",
				black: "#000000",
				shadedBlack: "rgb(0, 0, 0, 0.33)",
			},
			fontFamily: {
				primary: ["Montserrat", "sans-serif"],
				secondary: ["Poppins", "sans-serif"],
				sans: ["Inter var", ...defaultTheme.fontFamily.sans],
			},
		},
	},
	plugins: [
		require("@tailwindcss/forms"),
		require("@tailwindcss/aspect-ratio"),
		require("@tailwindcss/typography"),
		require("@tailwindcss/container-queries"),
	],
};
