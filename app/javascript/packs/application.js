require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("stylesheets/application.scss")
//= require lightbox

// import "bootstrap";
// import "../stylesheets/application.scss";



//Select2
import { initSelect2 } from '../plugins/init_select2';
initSelect2();

//Toggle Infos
import { toggleBtn } from '../plugins/infoToggle';
toggleBtn();

