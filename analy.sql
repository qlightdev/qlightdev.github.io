SELECT 
          TABLE_NAME,
          ENGINE,
          ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024, 2) AS total_mb,
          ROUND(DATA_FREE / 1024 / 1024, 2) AS free_mb,
          ROUND((DATA_FREE / (DATA_LENGTH + INDEX_LENGTH)) * 100, 2) AS frag_ratio
      FROM information_schema.TABLES
      WHERE TABLE_SCHEMA = 'DMGboards' AND TABLE_TYPE = 'BASE TABLE'
          AND ( 
			 (DATA_LENGTH + INDEX_LENGTH) >= 104857600
      OR (DATA_FREE / (DATA_LENGTH + INDEX_LENGTH)) > 0.25
      OR DATA_FREE >= 104857600
			 );
