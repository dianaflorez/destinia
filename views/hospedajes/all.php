<?php
$content = __DIR__ . '/all.php';
$layout = dirname(__DIR__, 1) . '/layout/main.php';
?>

<h5>Lista de Hospedajes</h5>

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