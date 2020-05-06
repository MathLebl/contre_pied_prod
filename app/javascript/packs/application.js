require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import Swup from "swup";

import initNavbar from '../packs/navbarScroll'
initNavbar()



// Swup Initiation
const swup = new Swup();


// toggleBtn();


import { toggleBtn } from '../packs/listInfoToggle';
toggleBtn();
