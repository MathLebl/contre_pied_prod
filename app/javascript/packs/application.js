require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import Swup from "swup";
import { toggleBtn } from '../packs/listInfoToggle';
toggleBtn();
// Swup Initiation
const swup = new Swup();


