require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import Swup from "swup";
import { toggleBtn } from '../listInfoToggle';
toggleBtn();
// Swup Initiation
const swup = new Swup();


