//= link_tree ../images
//= link_tree ../../javascript .js
//= link_tree ../../../vendor/javascript .js
//= link_tree ../builds

//function to change companies
(function() {
    $(function() {
      return $('.chosen-select').chosen({
        onchange: 'this.form.submit()',
        allow_single_deselect: true,
        no_results_text: 'No results matched',
        width: '200px'
      });
    });

  }).call(this);
