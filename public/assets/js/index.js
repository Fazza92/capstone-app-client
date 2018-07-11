// var HomePage = {
//   template: "#home-page",
//   data: function() {
//     return {
//       message: "Welcome to Vue.js!"
//     };
//   },
//   created: function() {},
//   methods: {},
//   computed: {}
// };

// var MeetupsShowPage = {
//   template: "#meetups-show-page",
//   data: function() {
//     return {
//       meetup: {
//         name: "",
//         start_time: "",
//         end_time: "",
//         description: "",
//       }
//     };
//   },
//   created: function() {
//     axios
//     .get("/api/meetups/:id")
//     .then(function(response) {
//       this.meetup.data;
//     }.bind(this));
//   },
//   methods: {},
//   computed: {}
// };

// var SignupPage = {
//   template: "#signup-page",
//   data: function() {
//     return {
//       name: "",
//       email: "",
//       password: "",
//       passwordConfirmation: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         name: this.name,
//         email: this.email,
//         password: this.password,
//         password_confirmation: this.passwordConfirmation
//       };
//       axios
//         .post("/users", params)
//         .then(function(response) {
//           router.push("/login");
//         })
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   }
// };

// var router = new VueRouter({
//   routes: [
//             { path: "/", component: HomePage }
//             { path: "/signup", component: SignupPage }
//             { path: "/meetups", component: MeetupHomePage }
//             { path: "/meetups/new", component: MeetupsNewPage }

//           ],
//   scrollBehavior: function(to, from, savedPosition) {
//     return { x: 0, y: 0 };
//   }
// });

// var app = new Vue({
//   el: "#vue-app",
//   router: router
// });
