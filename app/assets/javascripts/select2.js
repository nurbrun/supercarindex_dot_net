$(document).ready(function() {
  $('select#manufacturer-search').select2({
    placeholder: "Choose a Manufacturer",
    allowClear: true,
    width: '100%',
  });
  $('select#model-search').select2({
    placeholder: "Choose a Model",
    allowClear: true,
    width: '100%',
 
  });
  $('select#city-search').select2({
    placeholder: "Choose a City",
    allowClear: true,
    width: '100%',

  });
  $('select#country-search').select2({
    placeholder: "Choose a Country",
    allowClear: true,
    width: '100%',

  });
});