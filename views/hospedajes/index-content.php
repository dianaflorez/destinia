
<div class="row">
    <div class="col s12">
        <h1>HOSPEDAJE</h1>
        <div class="input-field">
            <input type="text" id="autocomplete-input" class="autocomplete">
            <label for="autocomplete-input">Busca aquí tu Hospedaje</label>
        </div>
    </div>
</div>

<div id="results">
    <?php if (!empty($results)): ?>
        <ul class="collection">
            <?php foreach ($results as $result): ?>
                <li class="collection-item">
                    <?php echo $result['name']; ?>,
                    <?php if ($result['type'] == 'hotel'): ?>
                        <?php echo $result['details']['stars']; ?> estrellas,
                        habitación <?php echo $result['details']['room_type']; ?>,
                    <?php else: ?>
                        <?php echo $result['details']['total_apartments']; ?> apartamentos,
                        <?php echo $result['details']['max_adults']; ?> adultos,
                    <?php endif; ?>
                    <?php echo $result['city']; ?>,
                    <?php echo $result['province']; ?>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>No se encontraron resultados.</p>
    <?php endif; ?>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var input = document.querySelector('#autocomplete-input');
        input.addEventListener('input', function() {
            if (this.value.length >= 3) {
                fetch('index.php?controller=hospedaje&action=all&prefix=' + this.value)
                    .then(response => response.text())
                    .then(data => {
                        document.querySelector('#results').innerHTML = data;
                    });
            } else {
                document.querySelector('#results').innerHTML = '';
            }
        });
    });
</script>