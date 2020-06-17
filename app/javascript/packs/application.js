require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("stylesheets/application.scss")

import "bootstrap";
import "../stylesheets/application.scss";





// toggleBtn();
import { toggleBtn } from '../packs/listInfoToggle';
toggleBtn();


//Select2
import { initSelect2 } from '../plugins/init_select2';
initSelect2();
