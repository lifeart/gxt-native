import './style.css';
import "glint-environment-gxt";
import "decorator-transforms/globals";
import { renderComponent } from '@lifeart/gxt';
import MyApp from './Application';
renderComponent(new MyApp({}), document.getElementById('app'));