//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.yinhai.ta404.module.autoconfigure;

import com.yinhai.ta404.module.annotation.ConditionOnDataSourceProperty;
import com.yinhai.ta404.module.datasource.properties.DataSourceProperties;
import com.yinhai.ta404.module.datasource.transaction.builder.TransactionManagerBuilder;
import javax.sql.DataSource;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@ConditionOnDataSourceProperty
@AutoConfigureAfter({Ta3DataSourceAutoConfiguration.class})
@EnableConfigurationProperties({DataSourceProperties.class})
//@ConditionalOnMissingBean({PlatformTransactionManager.class})
public class TransactionManagerAutoConfiguration {
    private final TransactionManagerBuilder builder;

    public TransactionManagerAutoConfiguration(BeanFactory beanFactory, DataSourceProperties dataSourceProperties) {
        this.builder = TransactionManagerBuilder.create(beanFactory, dataSourceProperties);
    }

    @Bean(
        name = {"transactionManager", "ta404dsTransactionManager"}
    )
    @Primary
//    @ConditionalOnMissingBean
    public PlatformTransactionManager transactionManager(@Autowired DataSource dataSource) {
        return this.builder.transactionManager(dataSource);
    }
}
