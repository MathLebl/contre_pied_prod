require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


import "bootstrap";
import Swup from "swup";
import "../stylesheets/application.scss";


// Swup Initiation
const swup = new Swup();


// toggleBtn();
import { toggleBtn } from '../packs/listInfoToggle';
toggleBtn();



//Select2
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
